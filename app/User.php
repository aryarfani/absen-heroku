<?php

namespace App;

use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements JWTSubject
{
    use Notifiable;
    protected $guarded = [];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }
    public function getJWTCustomClaims()
    {
        return [];
    }
    // User mempunyai banyak kehadiran
    // One to Many
    // public function kehadiran()
    // {
    //     return $this->hasMany(Kehadiran::class);
    // }

    public function kehadiran()
    {
        return $this->belongsToMany('App\Location', 'kehadirans', 'user_id', 'location_id')->withPivot("status", "id", "imei")->withTimestamps()->orderBy('kehadirans.created_at', 'desc');
    }

    public function cuti()
    {
        return $this->hasMany(Cuti::class);
    }
}
