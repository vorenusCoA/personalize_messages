# personalize_messages
Script para mandar mensajes directos personalizados a nuestros followers de twitter.

## Instalación

- Ruby
- gemas: twitter

## Configuración

- Hay que tener registrada una app de twitter: https://apps.twitter.com/app/
- Asignar los valores de consumer_key, consumer_secret, access_token y access_token_secret obtenidos de la app de twitter.
- El mensaje a enviar se escribe como segundo parámetro del método create_direct_message() de la línea 37. Debe ser una String y, para ser personalizado a cada follower, contener #{key} en el lugar del nombre deseado.

## Uso

$ ruby personalize_messages.rb

## Ejemplo

client.create_direct_message(value, "Feliz año nuevo #{key}!")

Cada follower recibirá un mensaje con su nombre al final.

## Aclaración

Como dijo uncle Ben: "Todo poder conlleva una gran responsabilidad..."

El  uso indebido del script suele llevar a bloqueos y vituperios varios.
