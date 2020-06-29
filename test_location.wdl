workflow test_location {
    call find_tools
}

task find_tools {
    command {
        echo $PATH
        echo "@@@@@@@@@@@@@@@@"
        echo $MANPATH
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
        docker: "g3chen/wgsmetrics@sha256:5517c524bd0d3b39273b0ac4e16a52fc94b8d9c2c787e79a548183a1acc08670"
        modules: "picard/2.21.2"
    }
}
