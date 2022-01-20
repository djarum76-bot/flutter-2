class AgentList{
  String nama;
  String role;
  String skillQ;
  String skillE;
  String skillC;
  String skillX;
  String deskripsiSkillQ;
  String deskripsiSkillE;
  String deskripsiSkillC;
  String deskripsiSkillX;
  String biografi;
  String gambar;
  String gambarQ;
  String gambarE;
  String gambarC;
  String gambarX;

  AgentList({
    required this.nama,
    required this.role,
    required this.skillQ,
    required this.skillE,
    required this.skillC,
    required this.skillX,
    required this.deskripsiSkillQ,
    required this.deskripsiSkillE,
    required this.deskripsiSkillC,
    required this.deskripsiSkillX,
    required this.biografi,
    required this.gambar,
    required this.gambarQ,
    required this.gambarE,
    required this.gambarC,
    required this.gambarX,
  });
}

var listAgent = [
  AgentList(
      nama: 'Jett',
      role: 'Duelist',
      skillQ: "UPDRAFT",
      skillE: "TAILWIND",
      skillC: "CLOUDBURST",
      skillX: "BLADE STORM",
      deskripsiSkillQ: "INSTANTLY propel Jett high into the air.",
      deskripsiSkillE: "NSTANTLY propel Jett in the direction she is moving. If Jett is standing still, she will propel forward.",
      deskripsiSkillC: "INSTANTLY throw a projectile that expands into a brief vision-blocking cloud on impact with a surface. HOLD the ability key to curve the smoke in the direction of your crosshair.",
      deskripsiSkillX: "EQUIP a set of highly accurate throwing knives that recharge on killing an opponent. FIRE to throw a single knife at your target. ALTERNATE FIRE to throw all remaining daggers at your target.",
      biografi: "Representing her home country of South Korea, Jett's agile and evasive fighting style lets her take risks no one else can. She runs circles around every skirmish, cutting enemies before they even know what hit them.",
      gambar: 'images/jett.png',
      gambarQ: 'images/jett/Q.png',
      gambarE: 'images/jett/E.png',
      gambarC: 'images/jett/C.png',
      gambarX: 'images/jett/X.png',
  ),
  AgentList(
      nama: 'Omen',
      role: 'Controller',
      skillQ: "PARANOIA",
      skillE: "DARK COVER",
      skillC: "SHROUDED STEP",
      skillX: "FROM THE SHADOWS",
      deskripsiSkillQ: "EQUIP a blinding orb. FIRE to throw it forward, briefly reducing the vision range and deafening all players it touches. This projectile can pass through walls.",
      deskripsiSkillE: "EQUIP a shadow orb, entering a phased world to place and target the orbs. PRESS the ability key to throw the shadow orb to the marked location, creating a long-lasting shadow sphere that blocks vision. HOLD FIRE while targeting to move the marker further away. HOLD SECONDARY FIRE while targeting to move the marker closer. PRESS RELOAD to toggle normal targeting view.",
      deskripsiSkillC: "EQUIP a shrouded step ability and see its range indicator. FIRE to begin a brief channel, then teleport to the marked location.",
      deskripsiSkillX: "EQUIP a tactical map. FIRE to begin teleporting to the selected location. While teleporting, Omen will appear as a Shade that can be destroyed by an enemy to cancel his teleport, or press EQUIP for Omen to cancel his teleport.",
      biografi: "A phantom of a memory, Omen hunts in the shadows. He renders enemies blind, teleports across the field, then lets paranoia take hold as his foe scrambles to learn where he might strike next.",
      gambar: 'images/omen.png',
      gambarQ: 'images/omen/Q.png',
      gambarE: 'images/omen/E.png',
      gambarC: 'images/omen/C.png',
      gambarX: 'images/omen/X.png',
  ),
  AgentList(
      nama: 'Raze',
      role: "Duelist",
      skillQ: "BLAST PACK",
      skillE: "PAINT SHELLS",
      skillC: "BOOM BOT",
      skillX: "SHOWSTOPPER",
      deskripsiSkillQ: "INSTANTLY throw a Blast Pack that will stick to surfaces. RE-USE the ability after deployment to detonate, damaging and moving anything hit.",
      deskripsiSkillE: "EQUIP a cluster grenade. FIRE to throw the grenade, which does damage and creates sub-munitions, each doing damage to anyone in their range.",
      deskripsiSkillC: "EQUIP a Boom Bot. FIRE will deploy the bot, causing it to travel in a straight line on the ground, bouncing off walls. The Boom Bot will lock on to any enemies in its frontal cone and chase them, exploding for heavy damage if it reaches them.",
      deskripsiSkillX: "EQUIP a rocket launcher. FIRE shoots a rocket that does massive area damage on contact with anything.",
      biografi: "Raze explodes out of Brazil with her big personality and big guns. With her blunt-force-trauma playstyle, she excels at flushing entrenched enemies and clearing tight spaces with a generous dose of “boom.”",
      gambar: 'images/raze.png',
      gambarQ: 'images/raze/Q.png',
      gambarE: 'images/raze/E.png',
      gambarC: 'images/raze/C.png',
      gambarX: 'images/raze/X.png',
  ),
  AgentList(
      nama: 'Sage',
      role: "Sentinel",
      skillQ: "SLOW ORB",
      skillE: "HEALING ORB",
      skillC: "BARRIER ORB",
      skillX: "RESURRECTION",
      deskripsiSkillQ: "EQUIP a slowing orb. FIRE to throw a slowing orb forward that detonates upon landing, creating a lingering field that slows players caught inside of it.",
      deskripsiSkillE: "EQUIP a healing orb. FIRE with your crosshairs over a damaged ally to activate a heal-over-time on them. ALT FIRE while Sage is damaged to activate a self heal-over-time.",
      deskripsiSkillC: "EQUIP a barrier orb. FIRE places a wall that fortifies after a few seconds. ALT FIRE rotates the targeter.",
      deskripsiSkillX: "EQUIP a resurrection ability. FIRE with your crosshairs placed over a dead ally to begin resurrecting them. After a brief channel, the ally will be brought back to life with full health.",
      biografi: "The stronghold of China, Sage creates safety for herself and her team wherever she goes. Able to revive fallen friends and stave off aggressive pushes, she provides a calm center to a hellish fight.",
      gambar: 'images/sage.png',
      gambarQ: 'images/sage/Q.png',
      gambarE: 'images/sage/E.png',
      gambarC: 'images/sage/C.png',
      gambarX: 'images/sage/X.png',
  ),
  AgentList(
      nama: 'Sova',
      role: 'Initiator',
      skillQ: "SHOCK BOLT",
      skillE: "RECON BOLT",
      skillC: "OWL DRONE",
      skillX: "HUNTER'S FURY",
      deskripsiSkillQ: "EQUIP a bow with shock bolt. FIRE to send the explosive bolt forward, detonating upon collision and damaging players nearby. HOLD FIRE to extend the range of the projectile. ALTERNATE FIRE to add up to two bounces to this arrow.",
      deskripsiSkillE: "EQUIP a bow with recon bolt. FIRE to send the recon bolt forward, activating upon collision and revealing the location of nearby enemies caught in the line of sight of the bolt. Enemies can destroy this bolt. HOLD FIRE to extend the range of the projectile. ALTERNATE FIRE to add up to two bounces to this arrow.",
      deskripsiSkillC: "EQUIP an owl drone. FIRE to deploy and take control of movement of the drone. While in control of the drone, FIRE to shoot a marking dart. This dart will reveal the location of any player struck by the dart.",
      deskripsiSkillX: "EQUIP a bow with three long-range, wall-piercing energy blasts. FIRE to release an energy blast in a line in front of Sova, dealing damage and revealing the location of enemies caught in the line. This ability can be RE-USED up to two more times while the ability timer is active.",
      biografi: "Born from the eternal winter of Russia's tundra, Sova tracks, finds, and eliminates enemies with ruthless efficiency and precision. His custom bow and incredible scouting abilities ensure that even if you run, you cannot hide.",
      gambar: 'images/sova.png',
      gambarQ: 'images/sova/Q.png',
      gambarE: 'images/sova/E.png',
      gambarC: 'images/sova/C.png',
      gambarX: 'images/sova/X.png',
  )
];