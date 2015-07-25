# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'Administrator', password: 'password', password_confirmation: 'password', role: 'admin')

Translation.create(locale: 'en', key: 'login.username', value: 'Username')
Translation.create(locale: 'en', key: 'login.password', value: 'Password')
Translation.create(locale: 'en', key: 'login.header', value: 'Sign in')
Translation.create(locale: 'en', key: 'login.login', value: 'Login')
Translation.create(locale: 'en', key: 'login.forgotpassword', value: 'Forgot password?')
Translation.create(locale: 'en', key: 'login.rememberme', value: 'Remember me?')
Translation.create(locale: 'en', key: 'button.save', value: 'Save')
Translation.create(locale: 'en', key: 'button.edit', value: 'Edit')
Translation.create(locale: 'en', key: 'button.delete', value: 'Delete')
