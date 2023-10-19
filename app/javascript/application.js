// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import store from './redux/store'
import Greetings from './components/Greetings';
import Consultations from "./components/Consultations";


ReactDOM.render(
  <Provider store={store}>
    <Greetings />
    <Consultations />
  </Provider>,
  document.getElementById('root'),
);