# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

SystemLanguage.create(language_code: 'en', language_description: 'English')
SystemLanguage.create(language_code: 'es', language_description: 'Spanish')
SystemLanguage.create(language_code: 'sv', language_description: 'Swedish')
SystemLanguage.create(language_code: 'fr', language_description: 'French')

Country.create(country_code: 'US', description: 'United States of America')

State.create(country_id: '1', state_code: 'MA', description: 'Massachusetts')
State.create(country_id: '1', state_code: 'RI', description: 'Rhode Island')

User.create(username: 'Administrator', password: 'password', password_confirmation: 'password', role: 'admin', locale: 'en')

Translation.create(locale: 'en', key: 'login.username', value: 'Username')
Translation.create(locale: 'en', key: 'login.password', value: 'Password')
Translation.create(locale: 'en', key: 'login.header', value: 'Sign in')
Translation.create(locale: 'en', key: 'login.login', value: 'Login')
Translation.create(locale: 'en', key: 'login.forgotpassword', value: 'Forgot password?')
Translation.create(locale: 'en', key: 'login.rememberme', value: 'Remember me?')
Translation.create(locale: 'en', key: 'button.save', value: 'Save')
Translation.create(locale: 'en', key: 'button.edit', value: 'Edit')
Translation.create(locale: 'en', key: 'button.delete', value: 'Delete')
Translation.create(locale: 'en', key: 'button.search', value: 'Search')
Translation.create(locale: 'en', key: 'button.return_to_search', value: 'Return to Search')
Translation.create(locale: 'en', key: 'button.add_pay_component', value: 'Add Pay Component')
Translation.create(locale: 'en', key: 'page_header.departments', value: 'Departments')
Translation.create(locale: 'en', key: 'page_header.locations', value: 'Locations')