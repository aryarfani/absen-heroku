<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Location;

class LocationController extends Controller
{
    public function index()
    {
        $location = Location::all();
        return response()->json($location);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => ['required', 'min:5', 'max:40'],
            'address' => ['required', 'min:5', 'max:40'],
            'latitude' => ['required', 'min:1', 'max:40'],
            'longitude' => ['required', 'min:1', 'max:40'],
        ]);

        $location = new Location;
        $location->name = $request->name;
        $location->address = $request->address;
        $location->latitude = $request->latitude;
        $location->longitude = $request->longitude;
        $location->save();

        return response()->json($location);
    }

    public function destroy($id)
    {
        $location = Location::findOrFail($id);
        if ($location->delete()) {
            return response()->json($location);
        }
    }
}
