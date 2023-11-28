import http from 'k6/http';
import { DNS } from './config.js';
import { check, sleep } from 'k6';

export let options = {
    stages: [
        { duration: '3m', target: 500 }, // Ramp up to 50 virtual users over 1 minute
        { duration: '3m', target: 500 }, // Stay at 50 virtual users for 2 minutes
        { duration: '1m', target: 0 },  // Ramp down to 0 virtual users over 1 minute
    ],
    http: {
        requestTimeout: '20s',
    },
};

export default function () {
    let response = http.get(`http://${DNS}/users`);

    check(response, {
        'status is 200': (r) => r.status === 200,
    });

    // Simulate user think time
    sleep(1);
}
