<?php

use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AdminDashboardController;
use App\Http\Controllers\AdminMessageController;
use App\Http\Controllers\AdminSkillController;
use App\Http\Controllers\PesanController;
use App\Http\Controllers\PortfolioController;
use App\Http\Middleware\AdminAuth;
use Illuminate\Support\Facades\Route;

// Halaman publik
Route::get('/', [PortfolioController::class, 'index'])->name('home');
Route::post('/pesan', [PesanController::class, 'store'])->name('pesan.store');

// Halaman admin
Route::prefix('admin')->name('admin.')->group(function () {
    Route::redirect('/', '/admin/dashboard');

    Route::get('/login', [AdminAuthController::class, 'create'])->name('login');
    Route::post('/login', [AdminAuthController::class, 'store'])->name('login.store');

    Route::middleware(AdminAuth::class)->group(function () {
        Route::post('/logout', [AdminAuthController::class, 'destroy'])->name('logout');

        Route::get('/dashboard', AdminDashboardController::class)->name('dashboard');

        Route::get('/skills/create', [AdminSkillController::class, 'create'])->name('skills.create');
        Route::post('/skills', [AdminSkillController::class, 'store'])->name('skills.store');
        Route::get('/skills/{skill}/edit', [AdminSkillController::class, 'edit'])->name('skills.edit');
        Route::put('/skills/{skill}', [AdminSkillController::class, 'update'])->name('skills.update');
        Route::delete('/skills/{skill}', [AdminSkillController::class, 'destroy'])->name('skills.destroy');

        Route::get('/pesan', AdminMessageController::class)->name('messages.index');
    });
});


// Endpoint JSON sederhana untuk integrasi frontend / aplikasi lain.
Route::prefix('api')->name('api.')->group(function () {
    Route::get('/profile', [\App\Http\Controllers\CvApiController::class, 'profile'])->name('profile');
    Route::get('/skills', [\App\Http\Controllers\CvApiController::class, 'skills'])->name('skills');
});
