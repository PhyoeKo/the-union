<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Patient extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'code', 'volunteer_id'];

    public function volunteer()
    {
        return $this->belongsTo(Volunteer::class);
    }

    public static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            $model->code = str_pad(mt_rand(1, 999999), 6, '0', STR_PAD_LEFT);
        });
    }

}
