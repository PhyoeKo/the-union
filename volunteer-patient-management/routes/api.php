<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


use App\Http\Controllers\API\Admin\AuthController;
use App\Http\Controllers\API\Admin\PatientController;
use App\Http\Controllers\API\Admin\VolunteerController;
use App\Http\Controllers\API\Volunteer\AuthController as VolunteerAuthController;
use App\Http\Controllers\API\Volunteer\PatientController as VolunteerPatientController;

//Admin Login
Route::controller(AuthController::class)->group(function(){
    Route::post('register', 'register');
    Route::post('login', 'login');
});

Route::middleware('auth:sanctum')->group(function(){
    Route::get('/volunteers', [VolunteerController::class, 'index']);
    Route::post('/volunteers', [VolunteerController::class, 'store']);
    Route::get('/patients', [PatientController::class, 'index']);
    Route::post('/patients', [PatientController::class, 'store']);
});

Route::post('/volunteer/login', [VolunteerAuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function(){
    Route::get('/volunteer/patients', [VolunteerPatientController::class, 'index']);
});