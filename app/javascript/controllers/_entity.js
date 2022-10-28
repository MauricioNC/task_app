window.onload = () => {
  if(document.querySelector('.show_options'))
  {
    const entity_show_options = document.querySelector('.show_options');
    const entity_options = document.getElementById('options');
    let entity_options_display;
  
    if(entity_options) { 
      entity_options_display = window.getComputedStyle(entity_options); 
      entity_show_options.addEventListener('click', () => {
        entity_options_display.getPropertyValue('display') == 'none'
          ? entity_options.style.setProperty('display', 'block')
          : entity_options.style.setProperty('display', 'none');
      });
    }
    
  }
}
