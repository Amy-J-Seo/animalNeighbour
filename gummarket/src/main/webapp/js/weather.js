/**
 * 
 */
const weather = document.querySelector(".js-weather");

const API_KEY = "b7bca4b8d78a93f6c6c9ca142f3e84bc";
const COORDS = 'coords';

function getWeather(lat, lon) {
    fetch(
        `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&APPID=${API_KEY}&units=metric`
    ).then(function (response) {
        return response.json();
    }).then(function (json) {
        console.log(json);
        const temperature = json.main.temp;
		const weather11 = json.weather[0].main;
        const place = json.name;
        weather.innerText = `${place}에서 접속하셨습니다! 현재 기온: ${temperature} 날씨: ${weather11}`;
    })
    // fetch(
    //     `http://api.openweathermap.org/data/2.5/weather?q=Melbourne,au&APPID=b7bca4b8d78a93f6c6c9ca142f3e84bc&units=metric`
    // ).then(function (response) {
    //     return response.json();
    // }).then(function (json) {
    //     console.log(json);
    //     const temperature = json.main.temp;
    //     const place = json.name;
    //     weather.innerText = `${temperature} @ ${place}`;
    // })
}

function saveCoords(coordsObj) {
    localStorage.setItem(COORDS, JSON.stringify(coordsObj));
}

function handleGeoSuccess(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    const coordsObj = {
        latitude: latitude,
        longitude: longitude
    };
    saveCoords(coordsObj);
    getWeather(latitude, longitude)
}

function handleGeoError() {
    console.log('Cannot access the location');
}
function askForCoords() {
    navigator.geolocation.getCurrentPosition(handleGeoSuccess, handleGeoError);
}

function loadCoords() {
    const loadedCoords = localStorage.getItem(COORDS);
    if (loadedCoords === null) {
        askForCoords();
    } else {
        // get weather
        const parseCoords = JSON.parse(loadedCoords);
        console.log(parseCoords.latitude, parseCoords.longitude);
        getWeather(parseCoords.latitude, parseCoords.longitude);
    }
}

function init() {
    loadCoords();
}

init();