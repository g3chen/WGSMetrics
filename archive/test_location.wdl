workflow test_location {
    call find_tools
}

task find_tools {
    command {
        whereis java
        echo "@@@@@@@@@@@@@@@@"
        echo $MANPATH
        echo "@@@@@@@@@@@@@@@@"
        echo $PATH
        echo "@@@@@@@@@@@@@@@@"
        echo $LD_LIBRARY_PATH
        echo "@@@@@@@@@@@@@@@@"
        ls $JAVA_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $PICARD_ROOT
    }
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/picard:1.0"
    }
}
