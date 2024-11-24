export const awsconfig = {
    Auth: {
        Cognito: {
            userPoolId: 'us-east-1_09dfwiPzH',
            userPoolClientId: '54ddjbgk72792farqvfb5e9fn7',
            signUpVerificationMethod: 'code',
            loginWith: {
                oauth: {
                    domain: 'ppw.auth.us-east-1.amazoncognito.com',
                    scopes: [
                        'email',
                        'phone',
                        'openid',
                    ],
                    redirectSignIn: ['https://localhost:3000/chatroom'],
                    redirectSignOut: ['https://localhost:3000/chatroom'],
                    responseType: 'code',
                },
            },
        },
    },
};
