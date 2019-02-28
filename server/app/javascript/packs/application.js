/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'babel-polyfill';
import jQuery from 'jquery'
import 'jquery-ujs';
import 'jquery.growl';
import 'select2';
import 'select2/select2.css';
import 'select2-bootstrap-css/select2-bootstrap.css';
import 'icheck';
import 'icheck/skins/minimal/blue.css';
import './hello.scss';

import {init} from './init';

window.jQuery = jQuery;
window.$ = jQuery;
init();
