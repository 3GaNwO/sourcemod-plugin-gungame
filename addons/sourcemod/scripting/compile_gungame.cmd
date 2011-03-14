@echo off 

set DIR_SERVER_SOURCEMOD=D:\games\css_server\orangebox\cstrike\addons\sourcemod
set DIR_SERVER_SCRIPTING=%DIR_SERVER_SOURCEMOD%\scripting
set DIR_SERVER_PLUGINS=%DIR_SERVER_SOURCEMOD%\plugins

set DIR_SOURCES_SOURCEMOD=D:\home\altex\css_plugins-trunk\sm_gungame\addons\sourcemod
set DIR_SOURCES_SCRIPTING=%DIR_SOURCES_SOURCEMOD%\scripting
set DIR_SOURCES_PLUGINS=%DIR_SOURCES_SOURCEMOD%\plugins

set LOG_COMPILE=%DIR_SOURCES_SCRIPTING%\compile_gungame.log

xcopy /e /f /y %DIR_SOURCES_SCRIPTING%\*.* %DIR_SERVER_SCRIPTING%\

cd %DIR_SERVER_SCRIPTING%

echo %DATE% %TIME% > %LOG_COMPILE%

::%DIR_SERVER_SCRIPTING%\spcomp gungame.sp USE_SDK_HOOKS=1    >> %LOG_COMPILE%
::copy %DIR_SERVER_SCRIPTING%\gungame.smx                 %DIR_SOURCES_PLUGINS%\disabled\gungame_sdkhooks.smx
::copy %DIR_SERVER_SCRIPTING%\gungame.smx                 %DIR_SERVER_PLUGINS%\gungame_sdkhooks.smx

%DIR_SERVER_SCRIPTING%\spcomp gungame.sp                >> %LOG_COMPILE%
%DIR_SERVER_SCRIPTING%\spcomp gungame_afk.sp            >> %LOG_COMPILE%
%DIR_SERVER_SCRIPTING%\spcomp gungame_config.sp         >> %LOG_COMPILE%
%DIR_SERVER_SCRIPTING%\spcomp gungame_display_winner.sp >> %LOG_COMPILE%
%DIR_SERVER_SCRIPTING%\spcomp gungame_logging.sp        >> %LOG_COMPILE%
%DIR_SERVER_SCRIPTING%\spcomp gungame_mapvoting.sp      >> %LOG_COMPILE%
%DIR_SERVER_SCRIPTING%\spcomp gungame_stats.sp          >> %LOG_COMPILE%
%DIR_SERVER_SCRIPTING%\spcomp gungame_tk.sp             >> %LOG_COMPILE%
%DIR_SERVER_SCRIPTING%\spcomp gungame_bot.sp            >> %LOG_COMPILE%

copy %DIR_SERVER_SCRIPTING%\gungame.smx                 %DIR_SOURCES_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_afk.smx             %DIR_SOURCES_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_config.smx          %DIR_SOURCES_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_display_winner.smx  %DIR_SOURCES_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_logging.smx         %DIR_SOURCES_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_mapvoting.smx       %DIR_SOURCES_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_stats.smx           %DIR_SOURCES_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_tk.smx              %DIR_SOURCES_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_bot.smx             %DIR_SOURCES_PLUGINS%\

copy %DIR_SERVER_SCRIPTING%\gungame.smx                 %DIR_SERVER_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_afk.smx             %DIR_SERVER_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_config.smx          %DIR_SERVER_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_display_winner.smx  %DIR_SERVER_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_logging.smx         %DIR_SERVER_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_mapvoting.smx       %DIR_SERVER_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_stats.smx           %DIR_SERVER_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_tk.smx              %DIR_SERVER_PLUGINS%\
copy %DIR_SERVER_SCRIPTING%\gungame_bot.smx             %DIR_SERVER_PLUGINS%\

cd %DIR_SOURCES_SCRIPTING%
