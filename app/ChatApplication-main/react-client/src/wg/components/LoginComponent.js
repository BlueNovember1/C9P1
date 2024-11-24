// src/components/LoginComponent.js
import React from 'react';
import authService from '../services/AuthService';  // Zaimportuj instancję AuthService

const LoginComponent = () => {
    return (
        <div className="container d-flex flex-column align-items-center justify-content-center min-vh-100">
            <div className="mb-4">
                <h1 className="text-primary">Chat App</h1>
            </div>
            <div className="card shadow-lg w-50 text-center">
                <div className="card-body">
                    <h2 className="card-title mb-4">Sign In</h2>
                    <p className="mb-4">Use AWS Cognito Hosted UI to access your account.</p>
                    <button className="btn btn-primary btn-lg w-100" onClick={authService.logIn}>Sign in with Cognito</button>
                </div>
            </div>
        </div>
    );
};

export default LoginComponent;
