/* Initial beliefs and rules */

td_url("http://raw.githubusercontent.com/bruno-szdl/simulated-smartbuilding-tds/main/TD/lightbulb1.ttl").

/* Initial goals */

!start.

/* Plans */

+!start : td_url(Url) <-
 .print("hello world.");
 makeArtifact("lightbulb1", "ch.unisg.ics.interactions.jacamo.artifacts.wot.ThingArtifact", [Url, false], ArtId);
 .print("Lightbulb artifact created!");
 !switchOn.

+!switchOn <-
 .print("Switching on lightbulb1");
 invokeAction("https://w3id.org/saref#ToggleCommand", ["https://www.w3.org/2019/wot/json-schema#BooleanSchema"], [true])[artifact_name("lightbulb1")];
 !interval.

+!interval : true <- .wait(3000).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
