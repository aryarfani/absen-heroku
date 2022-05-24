<?php

namespace App\Http\Controllers;

use Illuminate\Support\Arr;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Validation\ValidationException;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    // Override this method to change the error validation message
    public function validate(
        Request $request,
        array $rules,
        array $messages = [],
        array $customAttributes = []
    ) {
        $validator = $this->getValidationFactory()->make(
            $request->all(),
            $rules,
            $messages,
            $customAttributes
        );

        if ($validator->fails()) {
            // get the validation errors
            $errors = (new ValidationException($validator))->errors();
            // take only errors' value without its key (attribute name)
            $errors = array_values($errors);
            // flatten the array
            $errors = Arr::flatten($errors);
            // turn array to comma separated string
            $errors = implode(' ', $errors);

            throw new HttpResponseException(response()->json(
                ['message' => $errors],
                JsonResponse::HTTP_UNPROCESSABLE_ENTITY
            ));
        }

        // get the attributes and values that were validated.
        return $validator->validated();
    }
}
