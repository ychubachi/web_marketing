# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#submit").click (event) ->
    family_name = $("#family_name").val()
    if(family_name == null || family_name == "")
      alert("「姓」をご記入ください。")
      $("#family_name").focus()
      return false

    given_name = $("#given_name").val()
    if(given_name == null || given_name == "")
      alert("「名」をご記入ください。")
      $("#given_name").focus()
      return false

    email = $("#email").val()
    if(email == null || email == "")
      alert("「E-Mail」をご記入ください。")
      $("#email").focus()
      return false

    atpos = email.indexOf("@");
    dotpos = email.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
      alert("E-Mailアドレスの形式が正しくありません")
      $("#email").focus()
      return false
    $("#email2").val(email)

    postal = $("#postal").val()
    numericExpression = /^[0-9]+$/
    if (! postal.match(numericExpression) || postal.length != 7)
      alert("郵便番号は数字7桁でご記入ください。")
      $("#postal").focus()
      return false

    address = $("#address").val()
    if(address == null || address == "")
      alert("住所をご記入ください。")
      $("#address").focus()
      return false
    
    comment = $("#comment").val()
    if(comment == null || comment == "")
      $("#comment").val("資料請求")

    alert "ご記入ありがとうございました。近日中にご連絡を差し上げます。\nAIITのウェブページに移動します。教員からのメッセージなど様々な情報をご覧ください（スマートフォン・携帯には最適化されておりません。ご了承ください。）"
    return true
