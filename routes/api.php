<?php

use Illuminate\Http\Request;
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
        Route::post('/cuti/{id}', 'CutiController@confirmCuti');

        // kehadiran route
        Route::post('/kehadiran', 'KehadiranController@store');
        Route::get('/kehadiran', 'KehadiranController@index');

        // user route
        Route::get('/', 'AdminController@getAuthUser');
        Route::get('/user', 'UserController@getAllUser');

        Route::get('/logout', 'AdminController@logout');
    });
});


Route::group(['prefix' => 'user'], function () {
    // auth route
    Route::post('/register', 'UserController@register');
    Route::post('/login', 'UserController@login');

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
        Route::resource('/location', 'LocationController')->only('index');
    });
});
