$(window.showSelectedValue = function(source){

// 2- Customers  change building
  $('#customer_id').change(function() {
    
    $('#buildings_id1').removeAttr('hidden');
    var data = {};
    //console.log("source = ", source);
    $.ajax({
      dataType: 'json',
      url: "/get_buildings/" + source,
      data: data,
      success: function(data, status){
        //console.log("source = ", source);
        //console.log(data);
        //console.log("data[0]['id'] = ", data[0]['id']);

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

  // 3- Buildings change battery
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
    
        console.log("data3 column", data3);
    

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
  
// 4- batteries change column
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
    
        console.log("data3 battery", data3);

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

// 5- Column change elevators
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
        
        console.log("data3 column", data3);
        

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


  // 6- Elevators
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
        console.log("data3 elevator", data3);
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
    var value = source;
    //console.log(value);
    return value;
});

