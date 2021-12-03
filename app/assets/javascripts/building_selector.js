$(window.showSelectedValue = function(source){

// Customers  2 change building
  $('#customer_id').change(function() {
    //console.log("VALUE ON CHANGE = ", this.value);
    //$('#buildings_id1').show();
    //console.log($('#buildings_id1').attr('id'));
    //console.log($('#buildings_id1').get(0).id);
    //console.log($('#buildings_id1').prop('id'));
    $('#buildings_id1').removeAttr('hidden');
    //$(this).next("div").toggle(); 
    var data = {};
    console.log("source = ", source);
    $.ajax({
      dataType: 'json',
      url: "/get_buildings/" + source,
      data: data,
      success: function(data, status){
        console.log("source = ", source);
        console.log(data);
        console.log("data[0]['id'] = ", data[0]['id']);
  
        var array = [];        
        //$("#buildings_id1").empty();
        var key_out = [];

        $('#building_id').find('option').not(':first').remove();
        for (var i = 0; i < data.length; i++) {
          $('#building_id').append($('<option/>', { 
            key: data[i].id,
            text : data[i].id
          }));
        }
      }
    });
  });

  // buildings 3 change battery
  $('#building_id').change(function() {
    console.log("build_select changed");
    $('#batteries_id1').removeAttr('hidden');
    var data2 = {};
    var data = null;
    $.ajax({
      data3: data2,
      dataType: 'json',
      url: "/get_batteries/" + source,
      
      success: function(data3, status){
        //console.log("source = ", source);
        console.log("data3 column", data3);
        //console.log("data[0]['battery_type'] = ", data3[0]['battery_type']);

        $('#battery_id').find('option').not(':first').remove();
        for (var i = 0; i < data3.length; i++) {
          $('#battery_id').append($('<option/>', { 
            key: data3[i].id,
            text : data3[i].id
          }));
        }
      }
    });
    
  });
  
// batteries 4 change column
  $('#battery_id').change(function() {
    console.log("batteies_select changed");
    $('#columns_id1').removeAttr('hidden');
    var data2 = {};
    var data = null;
    $.ajax({
      data3: data2,
      dataType: 'json',
      url: "/get_columns/" + source,
      
      success: function(data3, status){
        //console.log("source = ", source);
        console.log("data3 battery", data3);
        //console.log("data[0]['battery_type'] = ", data3[0]['battery_type']);
  
        var array = [];        
        //$("#buildings_id1").empty();
        var key_out = [];

        $('#column_id').find('option').not(':first').remove();
        for (var i = 0; i < data3.length; i++) {
          $('#column_id').append($('<option/>', { 
            key: data3[i].id,
            text : data3[i].id
          }));
        }
      }
    });
    
  });

// Column 5 change elevators
  $('#column_id').change(function() {
    console.log("column_select changed");
    $('#elevators_id1').removeAttr('hidden');
    var data2 = {};
    var data = null;
    $.ajax({
      data3: data2,
      dataType: 'json',
      url: "/get_elevators/" + source,
      
      success: function(data3, status){
        //console.log("source = ", source);
        console.log("data3 column", data3);
        //console.log("data[0]['elevator_id'] = ", data3[0]['battery_type']);

        //console.log("data3[0]['serial_number'] = ", data3[0][0]['serial_number']);
        //console.log("data3['serial_number'] = ", data3['serial_number']);
        var array = [];        
        //$("#buildings_id1").empty();
        var key_out = [];

        $('#elevator_id').find('option').not(':first').remove();
        for (var i = 0; i < data3.length; i++) {
          $('#elevator_id').append($('<option/>', { 
            key: data3[i].id,
            text : data3[i].id
          }));
        }
      }
    });
    
  });



  $('#elevator_id').change(function() {
    console.log("elevator changed");
    //$('#columns_id1').removeAttr('hidden');
    var data2 = {};
    var data = null;
    $.ajax({
      data3: data2,
      dataType: 'json',
      url: "/get_elevators/" + source,
      
      success: function(data3, status){
        //console.log("source = ", source);
        console.log("data3 elevator", data3);
        //console.log("data[0]['battery_type'] = ", data3[0]['battery_type']);
  
        var array = [];        
        //$("#buildings_id1").empty();
        var key_out = [];

        
        //$('#elevator_id').find('option').not(':first').remove();
        for (var i = 0; i < data3.length; i++) {
          $('#elevator_id').append($('<option/>', { 
            key: data3[i].id,
            text : data3[i].serial_number
          }));
        }
        
      }
    });
    
  });



  $('#fictionnal_id').change(function() {
    console.log("elevator changed");
    //$('#columns_id1').removeAttr('hidden');
    var data2 = {};
    var data = null;
    $.ajax({
      data3: data2,
      dataType: 'json',
      url: "/get_elevators/" + source,
      
      success: function(data3, status){
        //console.log("source = ", source);
        //console.log("data3 elevator", data3);
        //console.log("data[0]['battery_type'] = ", data3[0]['battery_type']);
  
        var array = [];        
        //$("#buildings_id1").empty();
        var key_out = [];

        
        $('#elevator_id').find('option').not(':first').remove();
        for (var i = 0; i < data3.length; i++) {
          $('#elevator_id').append($('<option/>', { 
            key: data3[i].id,
            text : data3[i].serial_number
          }));
        }
        
      }
    });
    
  });

/*
    console.log("showSelectedValue");
    var ajax = new XMLHttpRequest();
    var method = "GET";
    var data = {};
    
    $.ajax({
      dataType: 'json',
      url: "/get_buildings/" + source,
      data: data,
      success: function(data, status){
          console.log("source = ", source);
          console.log(data);
          console.log("data[0]['full_name_of_the_building_administrator'] = ", data[0]['full_name_of_the_building_administrator']);
          $('#col_select').change(function() {
            //console.log("VALUE ON CHANGE = ", this.value);
            $('#buildings_id1').show();
          });
          
          var $el = $("#col_select");
            //$el.empty(); // remove old options
            //$.each(data, function(key, ) {
            //$el.append($("<option></option>").attr("value", data[0].full_name_of_the_building_administrator).text(key));
            $el.append($("<option></option>"));
            $('#col_select').html
          //});

      }});

    */

    var value = source;
    //console.log(value);
    return value;
});

