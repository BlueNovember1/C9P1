import axios from 'axios';
import { fetchAuthSession } from 'aws-amplify/auth';

// Tworzenie instancji axios
const http = axios.create({
    baseURL: 'https://52.72.7.104:8080/api',
    withCredentials: true,
});

// Interceptor do dodawania tokenu do nagłówków
http.interceptors.request.use(
    async (config) => {
        const apiBaseUrl = 'https://52.72.7.104:8080/api';

        // Jeśli URL nie pasuje, kontynuuj bez modyfikowania nagłówków
        if (!config.url.startsWith(apiBaseUrl)) {
            return config;
        }

        // Pobieranie sesji użytkownika z AWS Amplify
        try {
            const session = await fetchAuthSession();
            // Jeśli sesja jest prawidłowa, dodaj token do nagłówków
            if (session && session.tokens && session.tokens.idToken) {
                const token = session.tokens.idToken.toString();
                config.headers['Authorization'] = `Bearer ${token}`;
            }
        } catch (error) {
            console.error('Error fetching auth session:', error);
        }

        return config;
    },
    (error) => {
        // W przypadku błędu zwróć obiekt błędu
        return Promise.reject(error);
    }
);

// Exportowanie instancji API
export default http;
