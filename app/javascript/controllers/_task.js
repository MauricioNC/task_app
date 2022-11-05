export class Task
{
  show_task_options()
  {
    if(document.querySelector('.show_options--task'))
    {
      const task_show_options = document.querySelectorAll('.show_options--task');
      let task_options_display;

      for (let i = 0; i < task_show_options.length; i++) {
        task_show_options[i].addEventListener('click', () => {
          const task_options = document.querySelectorAll('.options_task');
          if(task_options) {

            task_options_display = window.getComputedStyle(task_options[i]);

            task_options_display.getPropertyValue('display') == 'none' ? task_options[i].style.setProperty('display', 'flex') : task_options[i].style.setProperty('display', 'none');
          }
        });
      }
    }
  }
}
