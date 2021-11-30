
// This is shorthand for $( document ).ready(function() { })
//$(document).ready(function() {
//    function updateTextArea(source) {
//       var value = source;
//        console.log(value);
//    }

    //your code goes here
 // });

$(window.showSelectedValue = function(source){

    console.log("TOTO");




    var ajax = new XMLHttpRequest();
    var method = "GET";
    var data = {};
    //data = html_options;
    $.ajax({
      dataType: 'json',
      
      url: "/get_buildings/" + source,
      data: data,
       
      success: function(data, status){

          console.log("source = ", source);
          console.log(data);
        //alert("Data: " + data + "\nStatus: " + status);
      }});
    

    var value = source;
    console.log(value);
    return value;
    //html_options = {:onchange => "updateTextArea(this.value)"}
    //$()
});
