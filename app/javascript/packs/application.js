// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'jquery'
import 'bootstrap'
window.$ = window.jQuery = require("jquery");
import 'stylesheets/application'

document.addEventListener('turbolinks:load', ()=>{
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
})

import flatpickr from "flatpickr";
import 'flatpickr/dist/l10n/zh'
// 只使用flatpickr的CSS样式
// require("flatpickr/dist/flatpickr.css")
// 或者使用不同的样式主题
require("flatpickr/dist/themes/dark.css")

document.addEventListener("turbolinks:load", () => {
    flatpickr("[data-behavior='flatpickr']", {
        // altInput: true,
        locale: "zh",
        altFormat: "Y-m-d",
        dateFormat: "Y-m-d"
    })
})


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
