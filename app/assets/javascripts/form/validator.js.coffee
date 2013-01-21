$(document).ready ->
  # for form submition
  $("#submit").click (event) ->
    family_name = $("#customer_family_name").val()
    if(family_name == null || family_name == "")
      alert("「姓」をご記入ください。")
      $("#family_name").focus()
      return false

    given_name = $("#customer_given_name").val()
    if(given_name == null || given_name == "")
      alert("「名」をご記入ください。")
      $("#given_name").focus()
      return false

    email = $("#customer_email").val()
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

    postal = $("#customer_postal_code").val()
    numericExpression = /^[0-9]+$/
    if (! postal.match(/^\d{3}-?\d{4}$/))
      alert("郵便番号は半角数字で123-4567または1234567の形式でご記入ください。")
      $("#postal_code").focus()
      return false

    address = $("#customer_address").val()
    if(address == null || address == "")
      alert("住所をご記入ください。")
      $("#address").focus()
      return false

    return true
