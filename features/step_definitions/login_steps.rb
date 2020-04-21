# Ficou mais limpa, mais simples e objetiva
# Uma step definition não deve conter tanta lógin assim. Ele tem ser pequeno e muito simples.

Quando("eu faço login com {string} e {string}") do |email, password|
  # Chamando o objeto "@login_page" e os metodos "go" e "with" instaciados no arquivo de hooks
  @login_page.go
  @login_page.with(email, password)
end

Então("devo ser autenticado") do
  # Usando o metodo "get_token" contido no modulo "Helpers.rb"
  expect(get_token.length).to be 147
end

Então("devo ver {string} na área logada") do |expect_name|
  # Usando o metodo "logged_user" contido na classe "SideBarView" dentro do arquivo "sidebar.rb"
  expect(@sidebar.logged_user).to eql expect_name
end

Então("não devo ser autenticado") do
  # Usando o metodo "get_token" contido no modulo "Helpers.rb"
  expect(get_token).to be nil
end

Então("devo ver a mensagem de alerta {string}") do |expect_message|
  # Chamando o objeto "@login_page" e o metodo "alert" instaciados no arquivo de hooks
  expect(@login_page.alert).to eql expect_message
end
