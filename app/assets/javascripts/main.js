console.log('Mic check');

//Shows the form to enter a new hook on the index page
const showHidden = () => {
    console.log("Clicked!");
    $('.add_new_hook').toggle()
};


//reveals the user menu to edit and logout
//TODO toggle takes params
const showUserMenu = () => {
    console.log('Clicked');
    $('.hidden_user_menu').toggle()
}; 

//reveals/hides new link form
const toggleNewLink = () => {
    $('.hidden_link_form').toggle()
};

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
    

    $("a").css(
        "color", "red" 
    )
      
    