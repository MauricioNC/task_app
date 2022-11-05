import { Entity } from "../controllers/_entity";
import { Task } from "../controllers/_task";

let docLoaded = false

document.onreadystatechange = () => {
  docLoaded = document.readyState === 'complete' ? true : false

  if (docLoaded) { main(); }
}

function main()
{
  const entity = new Entity;
  const task = new Task;

  entity.show_entity_options();
  task.show_task_options();
  redirect_delay();
}

function redirect_delay()
{
  let flash_notice = document.getElementById("flash-notice");

  if(flash_notice) {
    setTimeout(() => {
      window.location = '/';
    }, 3000);
  }
}
