
// This is shorthand for $( document ).ready(function() { })
//$(document).ready(function() {
//    function updateTextArea(source) {
//       var value = source;
//        console.log(value);
//    }

    //your code goes here
 // });
/*
 $(document).on('page:load', function showSelectedValue(source) {
    $('[btn btn-primary]').click(function(event) {
        alert('You clicked the Submit link');
        event.preventDefault();
      });
  }
 )
*/
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
          console.log("data[0]['full_name_of_the_building_administrator'] = ", data[0]['full_name_of_the_building_administrator']);

          //var divIn = document.createElement("div");
          //divIn.setAttribute("class", "row");
          //var rowNameId = "first_rowId";
          //divIn.setAttribute("id", rowNameId);
          //document.getElementsByTagName("fieldset").item(0).appendChild(divIn);
          //document.getElementById("buildings_building").value = data[0].full_name_of_the_building_administrator;
          var positionOfTagStr = [ "first", "second" ];
          console.log("data.length = ", data.length);
          //var divIn = document.createElement("div");
          //console.log("length id interventionz = ", document.getElementById("interventionz"));
          //console.log("length class container = ", document.getElementsByClassName("container").length);
          
          var divIn = document.createElement("div");
          divIn.setAttribute("class", "row");
          var rowNameId = "col-md-8 col-sm-8";
          divIn.setAttribute("id", rowNameId);
          document.getElementById("interventionz").item(0).appendChild(divIn);

          //document.getElementsByTagName("fieldset").item(0).appendChild(divIn);
          var inquiry_type = [ "buildings_building" ];
          
          var select_element = document.createElement("select");
          select_element.setAttribute("id", inquiry_type[0]);
          document.getElementsByTagName("fieldset").item(0).appendChild(select_element);
          var options_element = document.createElement("option");
          options_element.setAttribute("id", inquiry_type[0] + "2");
          //document.getElementsByClassName(inquiry_type[0]).item(0).appendChild(options_element);
          //document.getElementsByTagName("select").item(0).appendChild(options_element);
          //document.getElementsByTagName("select").item(0).appendChild(options_element);
          //document.getElementById("col_select").item(0).appendChild(options_element);
          document.getElementById("buildings_building").item(0).appendChild(options_element);
          console.log("len col_select = ", document.getElementById("col_select").length);
          for(var i = 0; i < data.length; i++) {
            //document.getElementsByClassName(inquiry_type[0])
            options_element.innerHTML = data[i].full_name_of_the_building_administrator;
            options_element.innerText = data[i].full_name_of_the_building_administrator;
            //$('#fieldset').append( 
            //    $("<option></option>").attr("value", data[i].full_name_of_the_building_administrator).text(data[i].full_name_of_the_building_administrator) 
            //    );
          }
          ///

          //$('[btn btn-primary]').click(function(event) {
          //  alert('You clicked the Submit link');
          //  event.preventDefault();
          //});
          //var select_element = document.createElement("select");
          //select_element.setAttribute("id", inquiry_type[1]);
          //document.getElementsByTagName("fieldset").item(0).appendChild(select_element);
          //$('#fieldset').append( 
          //    $("<option></option>").attr("value", data[0].full_name_of_the_building_administrator).text(data[0].full_name_of_the_building_administrator) 
          //  );

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
