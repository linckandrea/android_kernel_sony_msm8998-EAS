// SPDX-License-Identifier: GPL-2.0
/*
 * Copyright (C) 2020 Adithya R <gh0strider.2k18.reborn@gmail.com>.
 * Copyright (C) 2020 Andrea Pucci <linckandrea01@gmail.com>.
 */

#ifndef _STAMINA_H_
#define _STAMINA_H_

#include <linux/types.h>

#ifdef _STAMINA_H_
void set_stamina_mode(bool status);
bool get_stamina_mode(void);
#else
static inline void set_stamina_mode(bool status)
{
}
static inline bool get_stamina_mode()
{
	return false;
}
#endif

#endif /* _STAMINA_H_ */
