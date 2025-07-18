// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// Adicione este alerta para ver se o arquivo está sendo lido
alert("Alerta 1: Application.js foi carregado!");

import "bootstrap"

// Adicione este alerta para ver se a linha APÓS o import é alcançada
alert("Alerta 2: Bootstrap foi importado!");
