<?php

namespace App\Models;

use Illuminate\Auth\Middleware\Authenticate;
use Laravel\Sanctum\HasApiTokens;

class Volunteer extends User
{
    use HasApiTokens;
    protected $fillable = ['name', 'code', 'password'];

    public function patients()
    {
        return $this->hasMany(Patient::class);
    }

    public static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            $model->code = 'VOL_' . str_pad(mt_rand(1, 999999), 6, '0', STR_PAD_LEFT);
            $model->password = str_pad(mt_rand(1, 999999), 6, '0', STR_PAD_LEFT);
        });
    }

    public function setPasswordAttribute($password)
    {
        $this->attributes['password'] = $password;
    }
}
