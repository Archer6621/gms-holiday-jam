/// @description Insert description here
// You can write your code in this editor

global.upgrade_manager = self.id;

upgrade_credits = 1;

abilities = [];
core_abilities = []; // Tree roots

function add_ability(dep, ic, disable) {
	disable = is_undefined(disable) ? false : disable;
	ic = is_undefined(ic) ? spr_ability_placeholder : ic;
	var ability = {dependency: dep, icon: ic, unlocked: false, discovered: false, description: "", restrict: undefined, disabled: disable}
	array_push(abilities, ability);
	if (is_undefined(dep)) {
		array_push(core_abilities, ability);	
	}
	return ability;
}

function add_ability_discovered(dep, ic) {
	var ab = add_ability(dep, ic);
	ab.discovered = true;
	return ab;
}

function unlock(ability) {
	if (upgrade_credits > 0) {
		ability.unlocked = true;
		upgrade_credits -= 1;
	}
}

function restrict(ability1, ability2) {
	ability1.restrict = ability2;
	ability2.restrict = ability1;
}

function discover_random_ability() {
	var relevant_abilities = [];
	for (var i = 0; i < array_length(abilities); i++) {
		if (not abilities[i].discovered and not abilities[i].disabled) {
			array_push(relevant_abilities, abilities[i]);
		}
	}
	
	if (array_length(relevant_abilities) > 0) {
		randomize();
		array_choose(relevant_abilities).discovered = true;
	}
}

// Ability tree
afterburner_ability = add_ability(undefined, spr_ability_afterburner);
	flamethrower_ability = add_ability_discovered(afterburner_ability, spr_ability_flame);
	burst_ability = add_ability_discovered(afterburner_ability, spr_ability_burst);
	restrict(flamethrower_ability, burst_ability)
	
emp_blast_ability = add_ability(undefined, spr_ability_emp);
	emp_screen_ability = add_ability_discovered(emp_blast_ability, spr_ability_emp_screen);
	emp_immunity_ability = add_ability_discovered(emp_blast_ability, spr_ability_emp_immune);
	restrict(emp_screen_ability, emp_immunity_ability);

blink_ability = add_ability(undefined, spr_ability_blink, true);
	blink_free_ability = add_ability_discovered(blink_ability, spr_ability_blink_energy);
	ghost_blink_ability = add_ability_discovered(blink_ability, spr_ability_blink_ghost);
	restrict(blink_free_ability, ghost_blink_ability);

hull_repair_ability = add_ability(undefined, spr_ability_hull_repair);
	shock_wave_immunity_ability = add_ability_discovered(hull_repair_ability, spr_ability_shockwave_immunity);
	shock_wave_charge_ability = add_ability_discovered(hull_repair_ability, spr_ability_shockwave_charge);
	restrict(shock_wave_immunity_ability, shock_wave_charge_ability);
	
mass_amplifier_ability = add_ability(undefined, spr_ability_mass);
	force_blast_ability = add_ability_discovered(mass_amplifier_ability, spr_ability_forceblast);
	knockout_immunity_ability = add_ability_discovered(mass_amplifier_ability, spr_ability_knockout);
	restrict(force_blast_ability, knockout_immunity_ability);


// Afterburner starts discovered
afterburner_ability.discovered = true;

// Ability descriptions
var core = string("CORE: ")
var choice = string("CHOICE: ")
afterburner_ability.description = core + "The afterburner can be used to get yourself out of sticky situations with a continuous speed boost, at the cost of energy. Press SHIFT to use it!";
	flamethrower_ability.description = choice + "The afterburner will burn objects in its wake, degrading their hull integrity.";
	burst_ability.description = choice + "The afterburner's burst upgrade can deliver a short but powerful burst forward, at the cost of energy. Double tap SHIFT to use!";

emp_blast_ability.description = core + "The EMP blast allows you to detonate an EMP pulse, frying anything in its radius, including yourself. Press SPACE to use it!";
	emp_screen_ability.description = choice + "The EMP blast will cover an enourmous area.";
	emp_immunity_ability.description = choice + "Your reactor will be immune to EMP-based attacks, including your own.";

blink_ability.description = core + "The blink device teleports you forward at the cost of a large amount of energy. Press CTRL to use!";
	blink_free_ability.description = choice + "The blink device will not consume any energy.";
	ghost_blink_ability.description = choice + "Your ship will phase through objects after blinking for a short duration.";
	
hull_repair_ability.description = core + "The hull repair drones slowly repair your hull while you're outside of the shockwave."
	shock_wave_immunity_ability.description = choice + "Your ship will be immune to hull degradation caused by the shockwave."
	shock_wave_charge_ability.description = choice + "Your ship will charge its reactor while inside of the shockwave."
	
mass_amplifier_ability.description = core + "The mass amplifier greatly enhances your ship's mass, allowing you to knock objects away."
	force_blast_ability.description = choice + "The mass amplifier can temporarily concentrate its power to create a massive frontal force wave. Press Z to use!"
	knockout_immunity_ability.description = choice + "Your ship will recover much quicker from all malfunctions."