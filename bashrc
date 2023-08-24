export PATH="/data/data/com.termux/files/home/sbt/bin":$PATH

function gitcode() { 
	echo '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' 
}   

function chisel_generator(){
	cat /storage/emulated/0/Download/chisel_generate.txt
}


function scala_generate_template(){ 
	echo "sbt new scala/hello-world.g8" 
}

function chisel_grammar(){
	echo "val sum=Wire(Vec(4,UInt(1.W))) Vec only works with Chisel Data type"
	echo "io.sum :=sum.asUInt can't write io.sum:=sum"
	echo "val f = VecInit.fill(4)(Module(new FullAdder).io) VecInit.fill only works with Hardware type(Data wrapped by IO is hardware"
}
