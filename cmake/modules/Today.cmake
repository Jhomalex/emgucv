MACRO (TODAY)
    IF (WIN32 OR ANDROID)
        EXECUTE_PROCESS(COMMAND "date.exe" "/T" OUTPUT_VARIABLE TMP)
		MESSAGE(STATUS "date.exe: ${TMP}")
		IF (TMP)
          string(REGEX REPLACE "(..)/(..)/(....).*" "\\3" CURRENT_YEAR ${TMP})
		  string(REGEX REPLACE "(..)/(..)/(....).*" "\\2" CURRENT_MONTH ${TMP})
		  string(REGEX REPLACE "(..)/(..)/(....).*" "\\1" CURRENT_DAY_OF_MONTH ${TMP})
		ENDIF()
    ENDIF()
	
	IF(UNIX OR (NOT CURRENT_YEAR))
        EXECUTE_PROCESS(COMMAND "date" "+%d/%m/%Y" OUTPUT_VARIABLE TMP)
		MESSAGE(STATUS "date: ${TMP}")
		IF (TMP)
          string(REGEX REPLACE "(..)/(..)/(....).*" "\\3" CURRENT_YEAR ${TMP})
		  string(REGEX REPLACE "(..)/(..)/(....).*" "\\2" CURRENT_MONTH ${TMP})
		  string(REGEX REPLACE "(..)/(..)/(....).*" "\\1" CURRENT_DAY_OF_MONTH ${TMP})
		 ENDIF()
    ENDIF()
	
	IF(NOT CURRENT_YEAR)
	  #MESSAGE(SEND_ERROR "date not implemented")
      SET(CURRENT_YEAR 0000)
	  SET(CURRENT_MONTH 00)
	  SET(CURRENT_DAY_OF_MONTH 00)
	ENDIF()
ENDMACRO()