<?php

namespace App\Http\Controllers;

use App\Kehadiran;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class KehadiranController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return DB::table('kehadirans')
            ->join('users', 'users.id', '=', 'user_id')
            ->join('locations', 'locations.id', '=', 'location_id')
            ->select('users.name AS name', 'locations.name AS location', 'kehadirans.imei', 'kehadirans.created_at')
            ->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $kehadiran = new Kehadiran();
        $kehadiran->user_id = $request->user_id;
        $kehadiran->location_id = $request->location_id;
        $kehadiran->status = $request->status;
        $kehadiran->imei = $request->imei;

        $kehadiran->save();
        return response()->json();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
