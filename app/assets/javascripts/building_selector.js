
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
          //$().append();
          console.log("source = ", source);
          console.log(data);

          //var divIn = document.createElement("div");
          //divIn.setAttribute("class", "row");
          //var rowNameId = "first_rowId";
          //divIn.setAttribute("id", rowNameId);
          //document.getElementsByTagName("fieldset").item(0).appendChild(divIn);
          //document.getElementById("buildings_building").value = data[0].full_name_of_the_building_administrator;
          var positionOfTagStr = [ "first", "second" ];
          console.log("data.length = ", data.length);
          var divIn = document.createElement("div");
          //console.log("length id interventionz = ", document.getElementById("interventionz"));
          console.log("length class container = ", document.getElementsByClassName("container").length);
          //document.getElementsByClassName("container").item(0).appendChild(divIn);
          var divIn = document.createElement("div");
          divIn.setAttribute("class", "row");
          var rowNameId = "first_rowId";
          divIn.setAttribute("id", rowNameId);
          document.getElementsByTagName("fieldset").item(0).appendChild(divIn);
          var firstInput = document.createElement("input");
          firstInput.setAttribute("type", "number");
          firstInput.setAttribute("class", "form-control");
          firstInput.setAttribute("id", "5");
          var inquiry_type = [ "customers_customer", "buildings_building" ];
          //document.getElementById("number_elevators").value = nElevatorsTotal;
          for (var i = 0; i < data.length; i++) {
            //var divIn = document.createElement("div");
            var select_element = document.createElement("select");
            //divIn.setAttribute("class", "row");
            //var rowNameId = positionOfTagStr[0] + "_rowId";
            select_element.setAttribute("id", inquiry_type[0]);
            
            document.getElementsByTagName("fieldset").item(0).appendChild(select_element);
            
            
          }
          //document.getElementById("buildings_building").innerHTML = data[0].full_name_of_the_building_administrator;
          //document.getElementById("customers_customer").innerHTML = html;
        //alert("Data: " + data + "\nStatus: " + status);
      }});


    

    var value = source;
    //console.log(value);
    return value;
    //html_options = {:onchange => "updateTextArea(this.value)"}
    //$()
});
