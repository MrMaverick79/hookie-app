console.log('Mic check');

//toggle the bin and pencil icons in the hook menus
$(document).ready(function() {
    $('.link_name').mouseover(function(){
        const target = $(this).siblings()
        console.log(target);
        target.toggle( "slow", function(){

        })
    

    });
 

});



//Shows the form to enter a new hook on the index page
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

$(document).ready(function() {
    const input = $('#tag_input')
    const list = $('.new_tags')
    
    
    input.keydown(function(event) {
        
            console.log(event.which);
            if (event.which === 32 && input.val().length > 2 || event.which === 188 && input.val().length > 2) {
                
                console.log('Passing!');
                let newLi = document.createElement("li")
                
                newLi.innerHTML = input.val() + " "
                list.append(newLi); 
                input.val("") 
            }
    })
    
    

});
    

//remove tags from new tag list if added incorrectly
$(document).ready(function() {
    $('.new_tags').on('click', function() {

        ($(this.lastChild.remove()));

    })

})

//add all of the tags to the form so that they are submitted

//onclick
$(document).ready(function() {
    $('#tag_submit').mousedown(function(){
        console.log('mousedown');
        const input = $('#tag_input:text')
        //TODO: exisitng value is not accepted
        let text = $('.new_tags li').text()
        input.val(text); 
        console.log(input.val());
    })
});
//grab all of the ul li and the value of the input

//add them all to the 'Tag_id"

      
    