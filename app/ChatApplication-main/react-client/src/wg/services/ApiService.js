import axios from 'axios';
import http from '../../http.interceptor';  // Zaimportuj instancję API

class ApiService {
    constructor() {
        this.apiBaseUrl = 'https://44.202.57.192:8080/api'; // Przykładowa baza URL (zmień na swoją)
    }

    // Funkcja do pobierania wszystkich użytkowników
    getAllUsers() {
        console.log('Sending request to /api/user/all');
        return http.get(`${this.apiBaseUrl}/user/all`)
            .then(response => response.data)
            .catch(error => {
                console.error('There was an error fetching the users:', error);
                throw error;
            });
    }

    // Funkcja do tworzenia nowego użytkownika
    createUser() {
        console.log('Sending request to /api/user/create');
        return http.post(`${this.apiBaseUrl}/user/create`, {}, {
            headers: { 'Content-Type': 'application/json' }
        })
            .then(response => response.data)
            .catch(error => {
                console.error('There was an error creating the user:', error);
                throw error;
            });
    }
}

// Tworzenie instancji serwisu i eksport
export default new ApiService();

