/* Initial beliefs and rules */

// Please register here for using the Phantom X Robot: https://interactions.ics.unisg.ch/leubot
// Then add you API key below. *Note:* To use the robot, make sure that the dry run flag for ThingArtifacts
// is set to false. ThingArtifacts are instantiated on line 27 of inc/hypermedia.asl
api_key("API-KEY").
env_url("http://192.168.15.8:8080/environments/smartbuilding/").

//Check the default, lower and upper limits of the PhantomX joint parameters: https://github.com/Interactions-HSG/leubot
/* Initial goals */

!start.

/* Plans */

+!start : env_url(Url) <-
  .print("hello world.");
  makeArtifact("notification-server", "ch.unisg.ics.interactions.jacamo.artifacts.yggdrasil.NotificationServerArtifact", ["localhost", 8081], _);
  start;
  !load_environment("smartbuilding", Url);
  .wait(2000);
  .print("finished loading the environment").

{ include("inc/hypermedia.asl") }
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
