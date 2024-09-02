<?php

namespace App\Http\Controllers\API\Volunteer;

use App\Http\Controllers\API\BaseController;
use App\Http\Controllers\Controller;
use App\Http\Resources\PatientResource;
use App\Models\Patient;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class PatientController extends BaseController
{
    public function index(Request $request) : JsonResponse
    {
        $volunteer = $request->user();
        $patients = $volunteer->patients;
        $patientsData = $patients->map(function ($patient) use ($volunteer) {
            return [
                'id' => $patient->id,
                'name' => $patient->name,
                'code' => $patient->code,
                'volunteer_name' => $volunteer->name, // Add volunteer's name
                'created_at' => $patient->created_at->toDateTimeString(),
                'updated_at' => $patient->updated_at->toDateTimeString(),
            ];
        });
        return $this->sendResponse($patientsData, 'Patient list successfully.');
    }
}
