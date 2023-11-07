package ditheringLib;


import processing.core.*;
import processing.opengl.*;

/**
 * This is a template class and can be used to start a new processing Library.
 * Make sure you rename this class as well as the name of the example package 'template' 
 * to your own Library naming convention.
 * 
 * (the tag example followed by the name of an example included in folder 'examples' will
 * automatically include the example in the javadoc.)
 *
 * @example  
 */

public class OrderedDither {
	
	// myParent is a reference to the parent sketch
	PApplet myParent;
    PShader shader;
	int blockSize = 3;
	
	public final static String VERSION = "1.0.0";
	

	/**
	 * a Constructor, usually called in the setup() method in your sketch to
	 * initialize and start the Library.
	 * 
	 * @example Example1_ColorSwatch
	 * @example Example2_image_3D
	 * @example Example3_Experiments
	 * @param theParent the parent PApplet
	 */
	public OrderedDither(PApplet theParent) {
		myParent = theParent;
		shader = myParent.loadShader("ordered_dither.glsl");		
		
	}
	
	
	
	
	
	public void applyDither(int blockSize) {
		
		shader.set("blockSize", blockSize);
		myParent.filter(shader);
	}
	
	
	/**
	 * return the version of the Library.
	 * 
	 * @return String
	 */
	

	/**
	 * 
	 * @param theA the width of test
	 * @param theB the height of test
	 */
	public void releaseDither() {
        myParent.resetShader();
    }

	/**
	 * 
	 * @return int
	 */
	public int getVariable() {
		return blockSize;
	}
}

