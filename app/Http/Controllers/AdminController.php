<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Admin;

class AdminController extends Controller
{
    public $loginAfterSignUp = true;

    public function register(Request $request)
    {
        $admin = Admin::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => bcrypt($request->password),
        ]);

        $token = Auth::guard('admin')->login($admin);

        return $this->respondWithToken($token);
    }

    public function login(Request $request)
    {
        $credentials = $request->only(['email', 'password']);

        if (!$token = Auth::guard('admin')->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }
    public function getAuthUser(Request $request)
    {
        return response()->json(Auth::guard('admin')->user());
    }
    public function logout()
    {
        Auth::guard('admin')->logout();
        return response()->json(['message' => 'Successfully logged out']);
    }
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
        ]);
    }
}
