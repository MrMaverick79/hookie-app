console.log('Mic check');

//toggle the bin and pencil icons in the hook menus for the specific icon
$(document).ready(function() {
    $('.links_list li').hover(function(e){
        
        $(e.target).children(".edit_delete_icons").stop().toggle( "slow", function(){

        })
        
    });
   
});



//Shows the form to enter a new hook on the index page
// TODO send the keyword selected based on the specific board selected
const showHidden = () => {
    console.log("Clicked!");
    $('.add_new_hook').toggle("fast", function() {

    })
};


//reveals the user menu to edit and logout
//TODO toggle takes params
const showUserMenu = () => {
    console.log('Clicked');
    $('.hidden_user_menu').toggle("fast", function() {

    })
}; 

//reveals/hides new link form
$(document).ready(function() {
    $('.add_icon').on('click', function(){
        const target = $(this).nextAll()
        console.log(target);
        target.toggle( "slow", function(){

        })
    
    })
});


//confirm the deletion of account, link, hook
const  checkDelete = (id) => {
    console.log('Clicked');
    if (confirm('Are you sure you want to proceed?\n\nWARNING: This cannot be undone.')) {
        // Remove it
        console.log('This object was removed from the database.');
        return window.location.href = `/users/${id}/delete`;
        
      } else {
        // Do nothing!
        console.log('Thing was not removed from the database.');
        
      }

 
};

const  linkDelete = (id) => {
    console.log('Clicked');
    if (confirm('Are you sure you want to proceed?\n\nWARNING: This cannot be undone.')) {
        // Remove it
        console.log('This object was removed from the database.');
        return window.location.href = `/links/${id}/delete`;
        
      } else {
        // Do nothing!
        console.log('Thing was not removed from the database.');
        
      }
    };

    const  hookDelete = (id) => {
        console.log('Clicked');
        if (confirm('Are you sure you want to proceed?\n\nWARNING: This cannot be undone.')) {
            // Remove it
            console.log('This object was removed from the database.');
            return window.location.href = `/hooks/${id}/delete`;
            
          } else {
            // Do nothing!
            console.log('Thing was not removed from the database.');
            
          }
        };
    

//Tag entry form logic.
let tags = "" //need this to be global

$(document).ready(function() {
    const input = $('.tag_input')
   
    const list = $('.new_tags')
    
    
    input.keydown(function(event) {
            //breaks the tags into words using space or comma,
           
            text  = $(this).val() 
          
            if (event.which === 32 && text.length > 2 || event.which === 188 && text.length > 2) {
                
                console.log('Passing!');
                let newLi = document.createElement("li")
                
                newLi.innerHTML = text + " "
                //also add it to the global tags
                tags += text + " "
                list.append(newLi); 
                input.val("") 
                //need to make a function
            }
    });
    
    

});
    

//remove tags from new tag list if added incorrectly
$(document).ready(function() {
    $('.new_tags').on('click', function() {

        ($(this.lastChild.remove()));

    })

})


//add all of the tags to the input of the form so so that they are submitted

//need to create a global strong to add to


$(document).ready(function() {
    $('.tag_submit').mousedown( function(){
        // console.log('mousedown'); 
        
        const input = $('.tag_input').val()
        // console.log(`input= ${input}`);TESTING
        const text = $('.new_tags li').text()   //This will terater over each hook so

        // console.log(`Text= ${text}`); TESTING
        
        let finalInput = (text + input + tags);
        $('.tag_input').val(finalInput);
        // console.log($('#tag_input').val()); TESTING
    
       
    })
});
