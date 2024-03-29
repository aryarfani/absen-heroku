<?php

use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'admin'], function () {
    // auth route
    Route::post('/register', 'AdminController@register');
    Route::post('/login', 'AdminController@login');

    Route::group(['middleware' => 'jwtMiddleware'], function () {
        // location route
        Route::resource('/location', 'LocationController');

        // cuti route
        Route::get('/cuti', 'CutiController@index');
        Route::patch('/cuti/{id}', 'CutiController@confirmCuti');

        // jadwal route
        Route::get('/jadwal', 'JadwalController@index');
        Route::post('/jadwal', 'JadwalController@store');
        Route::patch('/jadwal', 'JadwalController@update');

        // kehadiran route
        Route::post('/kehadiran', 'KehadiranController@store');
        Route::get('/kehadiran', 'KehadiranController@index');

        // user route
        Route::get('/', 'AdminController@getAuthUser');
        Route::get('/user', 'UserController@getAllUser');

        Route::get('/logout', 'AdminController@logout');
    });
});

Route::group(['prefix' => 'user', 'as' => 'users.'], function () {
    // auth route
    Route::post('/register', 'UserController@register');
    Route::post('/login', 'UserController@login');
    // jadwal route
    Route::get('/jadwal', 'JadwalController@index');

    Route::group(['middleware' => 'jwtMiddleware'], function () {
        Route::post('/member/{id}', 'UserController@update');
        Route::get('/logout', 'UserController@logout');
        Route::get('/', 'UserController@getAuthUser');

        // Kehadiran Route
        Route::get('/{id}/kehadiran/', 'UserController@getKehadiran');
        Route::post('/kehadiran', 'KehadiranController@store');

        // Cuti Route
        Route::post('/{id}/cuti', 'CutiController@store');
        Route::get('/{id}/cuti', 'CutiController@getCutibyUserId');

        // Lokasi Route
        Route::resource('/location', 'LocationController');
    });
});
