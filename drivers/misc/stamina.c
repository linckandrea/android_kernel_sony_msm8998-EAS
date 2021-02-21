// SPDX-License-Identifier: GPL-2.0
/*
 * Copyright (C) 2020 Adithya R <gh0strider.2k18.reborn@gmail.com>.
 * Copyright (C) 2020 Andrea Pucci <linckandrea01@gmail.com>.
 */

#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/stamina.h>

static bool enabled = false;
module_param(enabled, bool, 0644);

void set_stamina_mode(bool status)
{
	enabled = status;
}

bool get_stamina_mode(void)
{
	return enabled;
}
