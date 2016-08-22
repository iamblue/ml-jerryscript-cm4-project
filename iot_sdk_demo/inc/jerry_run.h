#ifndef __JERRY_RUN_H__
#define __JERRY_RUN_H__

int js_entry (const char *source_p, const size_t source_size);
int js_eval (const char *source_p, const size_t source_size);
int js_loop (uint32_t ticknow);
void js_exit (void);

#endif