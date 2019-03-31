/*
 * generated by Xtext 2.17.0
 */
package org.xtext.sdu.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import org.xtext.sdu.ioT.Sensor
import org.xtext.sdu.ioT.SensorGroup
import org.xtext.sdu.ioT.SensorType
import org.xtext.sdu.ioT.SensorTypes
import org.xtext.sdu.ioT.DeviceTypes
import org.xtext.sdu.ioT.DeviceType
import org.xtext.sdu.ioT.Device
import org.xtext.sdu.ioT.DeviceGroup
import org.xtext.sdu.ioT.SensorGetMethod

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
	�emitSensortypes(resourceRoot)�
	�emitDevicetypes(resourceRoot)�
	
	�emitSensors(resourceRoot)��emitDevices(resourceRoot)�
	
	�emitSensorgroup(resourceRoot)��emitDevicegroup(resourceRoot)�
	
	�emitSensorGetMethod(resourceRoot)�
	'''
	
	def emitSensorGetMethod(Resource resourceRoot) 
	'''
	�IF resourceRoot.allContents.filter(SensorGetMethod).size > 0�
	getMethods = dict()
	�ENDIF�
	�FOR sensorGetMethod : resourceRoot.allContents.filter(SensorGetMethod).toIterable�
	getMethods[�sensorGetMethod.type.name�_�sensorGetMethod.method.name�(�FOR parameter : sensorGetMethod.method.parameters SEPARATOR ','��parameter��ENDFOR�)] = getattr(�sensorGetMethod.type.name�,�sensorGetMethod.method.name�(�FOR parameter : sensorGetMethod.method.parameters SEPARATOR ','��parameter��ENDFOR�))
	�ENDFOR�
	'''
	
	protected def CharSequence emitSensorgroup(Resource resourceRoot)
		'''�FOR sensorGroup : resourceRoot.allContents.filter(SensorGroup).toIterable�
		�sensorGroup.name� = [�FOR sensor : sensorGroup.sensors SEPARATOR ','��sensor.name��ENDFOR�]
		�ENDFOR�'''
	
	
	protected def CharSequence emitSensors(Resource resourceRoot)
		'''�FOR sensor : resourceRoot.allContents.filter(Sensor).toIterable�
		�sensor.name� = �sensor.type.name�()
		�ENDFOR�'''
	
	
	protected def CharSequence emitSensortypes(Resource resourceRoot)
		'''�FOR sensorTypes : resourceRoot.allContents.filter(SensorTypes).toIterable�
			�FOR sensorType : sensorTypes.types�
			�sensorType.importSensorLibrary�
			�ENDFOR�
			�ENDFOR�'''
			
			
	protected def CharSequence emitDevicetypes(Resource resourceRoot)
		'''�FOR deviceTypes : resourceRoot.allContents.filter(DeviceTypes).toIterable�
			�FOR deviceType : deviceTypes.types�
			�deviceType.importDeviceLibrary�
			�ENDFOR�
			�ENDFOR�'''
			
	protected def CharSequence emitDevices(Resource resourceRoot)
		'''�FOR device : resourceRoot.allContents.filter(Device).toIterable�
		�device.name� = �device.type.name�()
		�ENDFOR�'''
		
	protected def CharSequence emitDevicegroup(Resource resourceRoot)
		'''�FOR deviceGroup : resourceRoot.allContents.filter(DeviceGroup).toIterable�
		�deviceGroup.name� = [�FOR device : deviceGroup.devices SEPARATOR ','��device.name��ENDFOR�]
		�ENDFOR�'''
	
	
	protected def importSensorLibrary(SensorType sensorType) '''	
		import �sensorType.name� from �sensorType.name�
	'''
	
	protected def importDeviceLibrary(DeviceType deviceType) '''	
		import �deviceType.name� from �deviceType.name�
	'''
}
