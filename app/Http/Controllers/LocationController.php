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
