/*
 * generated by Xtext 2.17.0
 */
package org.xtext.sdu.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import org.xtext.sdu.ioT.Sensor
import org.xtext.sdu.ioT.SensorType
import org.xtext.sdu.ioT.SensorTypes
import org.xtext.sdu.ioT.SensorGroup

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class IoTGenerator extends AbstractGenerator {

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
		fsa.generateFile("system.py", generatePythonCode(resource))
	}
	
	
	protected def generatePythonCode(Resource resourceRoot) '''
	import pycom
	import time
	�FOR sensorTypes : resourceRoot.allContents.filter(SensorTypes).toIterable�
		�FOR sensorType : sensorTypes.types�
		�sensorType.importSensorLibrary�
		�ENDFOR�
	�ENDFOR�
	
	�FOR sensor : resourceRoot.allContents.filter(Sensor).toIterable�
	�sensor.name� = �sensor.type.name�()
	�ENDFOR�
	
	�FOR sensorGroup : resourceRoot.allContents.filter(SensorGroup).toIterable�
	�sensorGroup.name� = [�FOR sensor : sensorGroup.sensors SEPARATOR ','�"�sensor.name�"�ENDFOR�]
	�ENDFOR�
			
	'''
	
	protected def importSensorLibrary(SensorType sensorType) '''	
		import �sensorType.name� from �sensorType.name�
	'''
}
