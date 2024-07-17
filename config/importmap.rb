# Pin npm packages by running ./bin/importmap
pin "application"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/custom", under: "custom"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
