/**
 * generated by Xtext 2.16.0
 */
package org.xtext.sdu.ioT;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Fetch Data</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link org.xtext.sdu.ioT.FetchData#getFilter <em>Filter</em>}</li>
 *   <li>{@link org.xtext.sdu.ioT.FetchData#getDestination <em>Destination</em>}</li>
 *   <li>{@link org.xtext.sdu.ioT.FetchData#getConExp <em>Con Exp</em>}</li>
 * </ul>
 *
 * @see org.xtext.sdu.ioT.IoTPackage#getFetchData()
 * @model
 * @generated
 */
public interface FetchData extends EObject
{
  /**
   * Returns the value of the '<em><b>Filter</b></em>' reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Filter</em>' reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Filter</em>' reference.
   * @see #setFilter(EObject)
   * @see org.xtext.sdu.ioT.IoTPackage#getFetchData_Filter()
   * @model
   * @generated
   */
  EObject getFilter();

  /**
   * Sets the value of the '{@link org.xtext.sdu.ioT.FetchData#getFilter <em>Filter</em>}' reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Filter</em>' reference.
   * @see #getFilter()
   * @generated
   */
  void setFilter(EObject value);

  /**
   * Returns the value of the '<em><b>Destination</b></em>' reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Destination</em>' reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Destination</em>' reference.
   * @see #setDestination(EObject)
   * @see org.xtext.sdu.ioT.IoTPackage#getFetchData_Destination()
   * @model
   * @generated
   */
  EObject getDestination();

  /**
   * Sets the value of the '{@link org.xtext.sdu.ioT.FetchData#getDestination <em>Destination</em>}' reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Destination</em>' reference.
   * @see #getDestination()
   * @generated
   */
  void setDestination(EObject value);

  /**
   * Returns the value of the '<em><b>Con Exp</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Con Exp</em>' containment reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Con Exp</em>' containment reference.
   * @see #setConExp(EObject)
   * @see org.xtext.sdu.ioT.IoTPackage#getFetchData_ConExp()
   * @model containment="true"
   * @generated
   */
  EObject getConExp();

  /**
   * Sets the value of the '{@link org.xtext.sdu.ioT.FetchData#getConExp <em>Con Exp</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Con Exp</em>' containment reference.
   * @see #getConExp()
   * @generated
   */
  void setConExp(EObject value);

} // FetchData
